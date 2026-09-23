from sqlalchemy import Table, Column, Integer, ForeignKey
from core.database import Base

product_genders = Table(
    "product_genders",
    Base.metadata,
    Column("product_id", Integer, ForeignKey("productsTable.id"), primary_key=True),
    Column(
        "gender_id", Integer, ForeignKey("productsGenderTable.id"), primary_key=True
    ),
)
