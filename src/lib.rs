use concordium_std::*;

#[derive(Serialize,PartialEq,Eq,Debug,Clone,Copy)]
enum MyAccountState{
    Intact,
    Smashed,
}

// Creating a new account for our money storage
#[init(contract = "MyAccount")]
fn account_initialize<S: HasStateApi>(
    _ctx: &impl HasInitContext,
    _state_builder:&mut StateBuilder<S>,
)->InitResult<MyAccountState>{
    Ok(MyAccountState::Intact)
}

// Inserting CCDs in our account , allowed by everyone 
#[receive(contract = "MyAccount", name = "insert", payable )]
fn account_insert<S:HasStateApi>(
    _ctx:&impl HasReceiveContext,
    host: &impl HasHost<MyAccountState, StateApiType = S>,
    _amount:Amount,
)->ReceiveResult<()>{
    // Checking if the withdrawal hasn't already taken place
    ensure!(*host.state()==MyAccountState::Intact);
    // If no withdrawal has been done, then accepting the CCDs provided by the user.
    Ok(())
}

// enum WithdrawStatus{
//     NotOwner,
//     AlreadyWithdrawn,
//     TransferError,
// }

// Onlyowner function, withdrawal of balance from the account 
// #[receive(contract = "MyAccount" , name = "withdraw",mutable)]
// fn account_withdraw<S: HasStateApi>(
//     ctx: &impl HasReceiveContext,
//     host: &mut impl HasHost<MyAccountState,StateApiType=S>,
// )->Result<(),WithdrawStatus>{̀
//     let owner = ctx.owner();
//     let sender = ctx.sender();
    
//     ensure!(sender.matches_account(&owner),WithdrawStatus::NotOwner);
//     ensure!(*host.state() == MyAccountState::Intact,WithdrawStatus::AlreadyWithdrawn);

//     *host.state_mut() = MyAccountState::Smashed;

//     let balance = host.self_balance();
//     let transfer_result = host.invoke_transfer(&owner,balance);
//     ensure!(transfer_result.is_ok(),WithdrawStatus::TransferError);
//     Ok(())
// }

// Viewing the state and balance of our account
#[receive(contract = "MyAccount",name = "view")]
fn account_view<S:HasStateApi>(
    _ctx:&impl HasReceiveContext,
    host:&impl HasHost<MyAccountState,StateApiType=S>,
)->ReceiveResult<(MyAccountState,Amount)>{
    let current_state = *host.state();
    let current_balance = host.self_balance();
    Ok((current_state,current_balance))
}

#[concordium_cfg_test]
mod tests{
    use super::*;
    use test_infrastructure::*;

    #[concordium_test]
    fn test_init(){
        let ctx = TestInitContext::empty();
        let mut state_builder = TestStateBuilder::new();

        let state_result = account_initialize(&ctx , &mut state_builder);
        let state = state_result.expect_report("Contract initialization results in an error.");
        
        claim_eq!(
            state,
            MyAccountState::Intact,
            "MyAccountState should be intact after initialization."
        );
    }
    #[concordium_test]
    fn test_insert_intact(){
        let ctx  = TestReceiveContext::empty();
        let host = TestHost::new(MyAccountState::Intact , TestStateBuilder::new());
        let amount = Amount::from_micro_ccd(100);

        let result = account_insert(&ctx , &host ,amount);
        claim!(result.is_ok(),"Inserting CCD results in error.");
        assert_eq!(
            *host.state(),
            MyAccountState::Intact,
            "My Account state should still be intact."
        )
    }
    // #[concordium_test]
    // fn test_not_yet_withdrawn(){
    //     let mut ctx = TestReceiveContext::empty();
    //     let owner = AccountAddress([0u8;32]);
    //     ctx.set_owner(owner);
    //     let sender = Address::Account(owner);
    //     ctx.set_sender(sender);
    //     let mut host = TestHost::new(MyAccountState::Intact, TestStateBuilder::new());
    //     let balance = Amount::from_micro_ccd(100);
    //     host.set_self_balance(balance);
    //     let result = account_withdraw(&ctx , &mut host);

    //     claim!(result.is_ok(),"Withdrawing loaded account results in error.");
    //     claim_eq!(*host.state(), MyAccountState::Smashed,"Account balance should be withdrawn.");
    //     claim_eq!(
    //         host.get_transfers(),
    //         [(owner,balance)],
    //         "Withdrawing did not produce the correct transfers."
    //     );
    // }
    // #[concordium_test]
    // fn test_match_intact_not_owner(){

    //     let mut ctx = TestReceiveContext::empty();
    //     let owner = AccountAddress([0u8;32]);
    //     ctx.set_owner(owner);
    //     let sender = Address::Account(AccountAddress([1u8;32]));
    //     ctx.set_sender(sender);
    //     let mut host = TestHost::new(MyAccountState::Intact , TestStateBuilder::new());
    //     let balance = Amount::from_micro_ccd(100);
    //     host.set_self_balance(balance);

    //     let result = account_withdraw(&ctx , &mut host);

    //     claim_eq!(result , Err(WithdrawStatus::NotOwner),"Expected to fail with error NotOwner.");
    // }

}

