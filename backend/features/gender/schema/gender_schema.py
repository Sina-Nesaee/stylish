from pydantic import BaseModel


class GenderCreate(BaseModel):
    name: str


class GenderUpdate(BaseModel):
    name: str | None = None


class GenderResponse(BaseModel):
    id: int
    name: str
