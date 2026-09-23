from ..repository import (
    update_bank_accounts_repository,
    get_bank_accounts_repository,
    get_bank_accounts_by_id_repository,
    delete_bank_account_repository,
    create_bank_accounts_repository,
)
from sqlalchemy.orm import Session
from ..schema import BankAccountUpdate, BankAccountCreate
from ..model import BankAccountsModel
from ..exceptions import BankAccountsNotFound


def get_accounts_service(db: Session):
    return get_bank_accounts_repository(db)


def get_account_by_id_service(db: Session, bank_id: int):
    bank_account = get_bank_accounts_by_id_repository(db, bank_id)
    if bank_account is None:
        raise BankAccountsNotFound
    return bank_account


def create_bank_account_service(db: Session, bank_accounts: BankAccountCreate):
    bank_accounts = BankAccountsModel(
        user_id=bank_accounts.user_id,
        account_number=bank_accounts.account_number,
        account_holder=bank_accounts.account_holder,
        ifsc_code=bank_accounts.ifsc_code,
    )
    return create_bank_accounts_repository(db, bank_accounts)


def update_bank_account_service(
    db: Session, bank_id: int, bank_accounts: BankAccountUpdate
):
    bank_account = get_bank_accounts_by_id_repository(db, bank_id)
    if bank_account is None:
        raise BankAccountsNotFound
    data = bank_accounts.model_dump(exclude_unset=True)
    return update_bank_accounts_repository(db, bank_id, data)


def delete_bank_account_service(db: Session, bank_id: int):
    bank_account = get_bank_accounts_by_id_repository(db, bank_id)
    if bank_account is None:
        raise BankAccountsNotFound
    return delete_bank_account_repository(db, bank_id)
