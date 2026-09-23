from core.database import SessionLocal
from features.season.model.season_model import ProductSeasonModel


def season_seed():
    db = SessionLocal()

    season = [
        ProductSeasonModel(name="Spring"),
        ProductSeasonModel(name="Summer"),
        ProductSeasonModel(name="Autumn"),
        ProductSeasonModel(name="Winter"),
    ]
    db.add_all(season)
    db.commit()
    db.close()


if __name__ == "__main__":
    season_seed()
