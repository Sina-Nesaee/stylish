from sqlalchemy.orm import Session
from ..model import BankAccountsModel


def get_bank_accounts_repository(db: Session):
    return db.query(BankAccountsModel).all()


def get_bank_accounts_by_id_repository(db: Session, bank_id: int):
    return db.query(BankAccountsModel).filter(BankAccountsModel.id == bank_id).first()


def create_bank_accounts_repository(db: Session, bank_accounts: BankAccountsModel):
    db.add(bank_accounts)
    db.commit()
    db.refresh(bank_accounts)
    return bank_accounts


def update_bank_accounts_repository(db: Session, bank_id: int, bank_accounts: dict):
    bank_account = (
        db.query(BankAccountsModel).filter(BankAccountsModel.id == bank_id).first()
    )
    if bank_account is None:
        return None
    for key, value in bank_accounts.items():
        setattr(bank_account, key, value)
    db.commit()
    db.refresh(bank_account)
    return bank_account


def delete_bank_account_repository(db: Session, bank_id: int):
    bank_account = (
        db.query(BankAccountsModel).filter(BankAccountsModel.id == bank_id).first()
    )
    if bank_account is None:
        return None
    db.delete(bank_account)
    db.commit()
