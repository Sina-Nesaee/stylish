from pydantic import BaseModel, ConfigDict


class BrandCreate(BaseModel):
    name: str


class BrandUpdate(BaseModel):
    name: str | None = None


class BrandResponse(BaseModel):
    id: int
    name: str
    model_config = ConfigDict(from_attributes=True)
