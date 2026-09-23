from pydantic import BaseModel


class StyleCreate(BaseModel):
    name: str


class StyleUpdate(BaseModel):
    name: str | None = None


class StyleResponse(BaseModel):
    id: int
    name: str
