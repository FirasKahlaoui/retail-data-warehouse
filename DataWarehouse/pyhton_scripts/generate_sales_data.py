import pandas as pd
import random
from faker import Faker
from datetime import datetime

fake = Faker("fr_FR")

n_sales = 1000
quantity_range = (1, 10)
price_range = (5.00, 100.00)

# Generate sales data
sales = []
for _ in range(n_sales):
    sales.append({
        "IDVente": fake.uuid4(),
        "ClefDate": random.randint(1, 365),
        "ClefTemps": random.randint(1, 48),
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
