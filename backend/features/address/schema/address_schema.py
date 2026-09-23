from pydantic import BaseModel


class AddressCreate(BaseModel):
    user_id: int
    adress: str
    city: str | None = None
    state: str | None = None
    country: str | None = None
    pincode: int | None = None


class AddressUpdate(BaseModel):
    adress: str | None = None
    city: str | None = None
    state: str | None = None
    country: str | None = None
    pincode: int | None = None


class AddressResponse(BaseModel):
    id: int
    user_id: int
    adress: str
    city: str
    state: str
    country: str
    pincode: int
