from pydantic import BaseModel


class BankAccountCreate(BaseModel):
    user_id: int
    account_number: str
    account_holder: str
    ifsc_code: str


class BankAccountUpdate(BaseModel):
    account_number: str | None = None
    account_holder: str | None = None
    ifsc_code: str | None = None


class BankAccountResponse(BaseModel):
    id: int
    user_id: int
    account_number: str
    account_holder: str
    ifsc_code: str
