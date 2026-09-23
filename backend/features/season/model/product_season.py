from sqlalchemy import Table, Column, Integer, ForeignKey
from core.database import Base

product_season = Table(
    "product_season",
    Base.metadata,
    Column("product_id", Integer, ForeignKey("productsTable.id"), primary_key=True),
    Column(
        "season_id", Integer, ForeignKey("productsSeasonTable.id"), primary_key=True
    ),
)
