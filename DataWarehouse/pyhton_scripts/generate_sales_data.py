import pandas as pd
import random
from faker import Faker
from datetime import datetime

fake = Faker("fr_FR")

n_sales = 1000
date_range_start = '-1y'
date_range_end = datetime.today()
quantity_range = (1, 10)
price_range = (5.00, 100.00)

# Generate sales data
sales = []
for _ in range(n_sales):
    sale_date = fake.date_time_between(start_date=date_range_start, end_date=date_range_end)
    sales.append({
        "IDVente": fake.uuid4(),
        "DateVente": sale_date,
        "IDCaissier": random.randint(1, 10),
        "IDMagasin": random.randint(1, 5),
        "IDPromotion": random.randint(1, 10),
        "IDProduit": random.randint(1, 50),
        "IDClient": random.randint(1, 100),
        "IDModePaiement": random.randint(1, 4),
        "Quantite": random.randint(*quantity_range),
        "PrixUnitaire": round(random.uniform(*price_range), 2),
        "CoutAchat": round(random.uniform(1.00, 50.00), 2),
        "Remise": round(random.uniform(0.00, 10.00), 2)
    })
df_sales = pd.DataFrame(sales)

# Save to Excel
df_sales.to_excel("SourceVentes.xlsx", index=False)

print("Sales data generated and saved to SourceVentes.xlsx.")