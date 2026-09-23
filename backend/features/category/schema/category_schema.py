from pydantic import BaseModel, Field, ConfigDict


class CategoryCreate(BaseModel):
    name: str = Field(min_length=2, max_length=100)
    image: str = Field(min_length=10, max_length=1000)


class CategoryUpdate(BaseModel):
    name: str | None = Field(default=None, min_length=2, max_length=100)
    image: str | None = Field(default=None, min_length=10, max_length=1000)


class CategoryResponse(BaseModel):
    id: int
    name: str
    image: str
    model_config = ConfigDict(from_attributes=True)
