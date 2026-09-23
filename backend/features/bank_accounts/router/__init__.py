from fastapi import APIRouter
from .bank_account_router import router as bank_account_router

router = APIRouter(prefix="/bank_accounts", tags=["bank_accounts"])
router.include_router(bank_account_router)
