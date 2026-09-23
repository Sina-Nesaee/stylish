from fastapi import Request
from fastapi.responses import JSONResponse
from features.bank_accounts.exceptions import BankAccountsNotFound


def bank_accounts_exception_handlers(request: Request, exc: BankAccountsNotFound):
    return JSONResponse(status_code=404, content={"detail": "BankAccount not founded"})
