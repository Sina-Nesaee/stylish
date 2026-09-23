from pydantic import BaseModel


class SeasonCreate(BaseModel):
    name: str


class SeasonUpdate(BaseModel):
    name: str | None = None


class SeasonResponse(BaseModel):
    id: int
    name: str
