from core.database import SessionLocal
from features.gender.model import ProductGenderModel


def gender_seed():
    db = SessionLocal()
    genders = [
        ProductGenderModel(name="Men"),
        ProductGenderModel(name="women"),
        ProductGenderModel(name="kids"),
    ]
    db.add_all(genders)
    db.commit()
    db.close()


if __name__ == "__main__":
    gender_seed()
