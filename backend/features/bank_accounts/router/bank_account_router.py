from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from ..service import (
    update_bank_account_service,
    get_accounts_service,
    get_account_by_id_service,
    delete_bank_account_service,
    create_bank_account_service,
)
from core.database import get_db
from ..schema import BankAccountUpdate, BankAccountCreate, BankAccountResponse

router = APIRouter()


@router.get("/", response_model=list[BankAccountResponse])
def get_bank_account_router(db: Session = Depends(get_db)):
    return get_accounts_service(db)


@router.get("/{bank_id}", response_model=BankAccountResponse)
def get_bank_account_by_id_router(bank_id: int, db: Session = Depends(get_db)):
    return get_account_by_id_service(db, bank_id)


@router.post("/", status_code=201)
def create_bank_account_router(
    bank_accounts: BankAccountCreate, db: Session = Depends(get_db)
):
    return create_bank_account_service(db, bank_accounts)


@router.patch("/{bank_id}", response_model=BankAccountResponse)
def update_bank_account_router(
    bank_id: int, bank_account: BankAccountUpdate, db: Session = Depends(get_db)
):
    return update_bank_account_service(db, bank_id, bank_account)


@router.delete("/{bank_id}", status_code=204)
def delete_bank_account_router(bank_id: int, db: Session = Depends(get_db)):
    return delete_bank_account_service(db, bank_id)
