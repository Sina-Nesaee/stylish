from sqlalchemy import Column, String, Integer, ForeignKey
from sqlalchemy.orm import relationship
from core.database import Base


class BankAccountsModel(Base):
    __tablename__ = "bankAccountsTable"
    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("userstable.id"), nullable=False)
    account_number = Column(String, nullable=False)
    account_holder = Column(String, nullable=False)
    ifsc_code = Column(String, nullable=False)
    user = relationship("UserModel", back_populates="bank_account")
