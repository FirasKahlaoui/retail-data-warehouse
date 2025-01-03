import pandas as pd
import random
from faker import Faker

fake = Faker("fr_FR")

n_calendar = 365
n_time = 48
n_cash_register = 10
n_store = 5
n_promotion = 10
n_product = 50
n_client = 100
n_payment_mode = 4

# Tunisian-specific data
tunisian_cities = ["Tunis", "Sfax", "Sousse", "Gabès", "Bizerte", "Kairouan", "Ariana", "Monastir", "Ben Arous", "Nabeul"]
tunisian_streets = ["Avenue Habib Bourguiba", "Rue de Marseille", "Rue Ibn Khaldoun", "Rue de la Liberté", "Rue Hedi Chaker"]
tunisian_brands = ["Samsung", "Huawei", "Sagem", "Tunisie Telecom", "Ooredoo", "Orange"]
tunisian_categories = ["Électronique", "Vêtements", "Alimentaire", "Meubles", "Hygiène"]
tunisian_promotion_types = ["Réduction", "Montant Fixe", "Produit Offert"]
tunisian_governorates = [
    "Tunis", "Ariana", "Ben Arous", "Manouba", "Sousse", "Monastir", 
    "Mahdia", "Sfax", "Gabès", "Médenine", "Tataouine", "Gafsa", 
    "Kasserine", "Kairouan", "Sidi Bouzid", "Beja", "Jendouba", 
    "Le Kef", "Siliana", "Bizerte", "Nabeul", "Zaghouan", "Tozeur", 
    "Kebili"
]

# Generate calendar data
calendar = []
for i in range(1, n_calendar + 1):
    date = fake.date_between(start_date='-1y', end_date='today')
    calendar.append({
        "ClefDate": i,
        "Date": date,
        "Jour": date.strftime("%A"),
        "Semaine": date.isocalendar()[1],
        "Mois": date.month,
        "Trimestre": (date.month - 1) // 3 + 1,
        "Annee": date.year,
        "Ferie": random.choice(["Oui", "Non"])
    })
df_calendar = pd.DataFrame(calendar)

# Generate time data
time = []
for i in range(1, n_time + 1):
    hour = random.randint(0, 23)
    minute = random.choice([0, 15, 30, 45])
    time_str = f"{hour:02}:{minute:02}"
    time.append({
        "ClefTemps": i,
        "Temps": time_str,
        "Heure": hour,
        "Minute": minute,
        "AM_PM": "AM" if hour < 12 else "PM",
        "JourNuit": "Jour" if 6 <= hour <= 18 else "Nuit",
        "HeureCreuse": "Oui" if hour < 6 or hour > 22 else "Non"
    })
df_time = pd.DataFrame(time)

# Generate cash register data
cash_registers = []
for i in range(1, n_cash_register + 1):
    cash_registers.append({
        "ClefCaisse": i,
        "NumeroCaisse": fake.random_int(min=1000, max=9999),
        "TypeCaisse": random.choice(["Libre-Service", "Standard", "Express"])
    })
df_cash_registers = pd.DataFrame(cash_registers)

# Generate store data
stores = []
for i in range(1, n_store + 1):
    stores.append({
        "ClefMagasin": i,
        "NomMagasin": fake.company(),
        "NumeroMagasin": fake.random_int(min=1, max=1000),
        "Rue": random.choice(tunisian_streets),
        "Ville": random.choice(tunisian_cities),
        "Departement": random.choice(tunisian_governorates),
        "Pays": "Tunisie",
        "CodePostal": fake.postcode(),
        "Directeur": fake.name(),
        "Zone": fake.city_suffix(),
        "ZonePrecedente": fake.city_suffix(),
        "Region": random.choice(tunisian_governorates),
        "RegionPrecedente": random.choice(tunisian_governorates),
        "DatePremiereOuverture": fake.date_between(start_date='-20y', end_date='-5y'),
        "DateDerniereRenovation": fake.date_between(start_date='-5y', end_date='today')
    })
df_stores = pd.DataFrame(stores)

# Generate promotion data
promotions = []
for i in range(1, n_promotion + 1):
    start_date = fake.date_between(start_date='-1y', end_date='today')
    promotions.append({
        "ClefPromotion": i,
        "CodePromotion": f"P{i:03}",
        "NomPromotion": fake.catch_phrase(),
        "TypePromotion": random.choice(tunisian_promotion_types),
        "DateDebut": start_date,
        "DateFin": fake.date_between(start_date=start_date, end_date='+1m')
    })
df_promotions = pd.DataFrame(promotions)

# Generate product data
products = []
for i in range(1, n_product + 1):
    products.append({
        "ClefProduit": i,
        "CodeProduit": f"PRD{i:03}",
        "DescriptionProduit": fake.catch_phrase(),
        "MarqueProduit": random.choice(tunisian_brands),
        "CategorieProduit": random.choice(tunisian_categories),
        "Rayon": fake.word(),
        "PrixProduitRecommande": round(random.uniform(5, 1000), 2)
    })
df_products = pd.DataFrame(products)

# Generate client data
clients = []
for i in range(1, n_client + 1):
    clients.append({
        "ClefClient": i,
        "NomClient": fake.last_name(),
        "PrenomClient": fake.first_name(),
        "NumeroCarteClient": fake.uuid4(),
        "VilleClient": random.choice(tunisian_cities),
        "SexeClient": random.choice(["Homme", "Femme"]),
        "Age": random.randint(18, 70),
        "RevenusFoyer": random.randint(2000, 20000)
    })
df_clients = pd.DataFrame(clients)

# Generate payment mode data
payment_modes = [
    {"ClefModePaiement": 1, "CodePaiement": "CB", "Description": "Carte Bancaire", "TypePaiement": "Électronique"},
    {"ClefModePaiement": 2, "CodePaiement": "ESP", "Description": "Espèces", "TypePaiement": "Manuel"},
    {"ClefModePaiement": 3, "CodePaiement": "CHQ", "Description": "Chèque", "TypePaiement": "Manuel"},
    {"ClefModePaiement": 4, "CodePaiement": "PAY", "Description": "PayPal", "TypePaiement": "Électronique"}
]
df_payment_modes = pd.DataFrame(payment_modes)

# Save datasets to a single Excel file with separate sheets
with pd.ExcelWriter("Tunisian_Datasets.xlsx") as writer:
    df_calendar.to_excel(writer, sheet_name="Calendrier", index=False)
    df_time.to_excel(writer, sheet_name="Temps", index=False)
    df_cash_registers.to_excel(writer, sheet_name="Caisse", index=False)
    df_stores.to_excel(writer, sheet_name="Magasin", index=False)
    df_promotions.to_excel(writer, sheet_name="Promotion", index=False)
    df_products.to_excel(writer, sheet_name="Produit", index=False)
    df_clients.to_excel(writer, sheet_name="Client", index=False)
    df_payment_modes.to_excel(writer, sheet_name="ModePaiement", index=False)

print("Tunisian datasets generated and saved in 'Tunisian_Datasets.xlsx'.")
