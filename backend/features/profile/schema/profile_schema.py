from pydantic import BaseModel


class ProfileCreate(BaseModel):
    user_id: int
    first_name: str
    last_name: str
    phone: str | None = None
    avatar: str | None = None


class ProfileUpdate(BaseModel):
    first_name: str | None = None
    last_name: str | None = None
    phone: str | None = None
    avatar: str | None = None


class ProfileResponse(BaseModel):
    id: int
    user_id: int
    first_name: str
    last_name: str
    phone: str | None
    avatar: str | None
