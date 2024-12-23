import pandas as pd
import random
from faker import Faker

fake = Faker()

n_calendar = 365
n_time = 48
n_cash_register = 10
n_store = 5
n_promotion = 10
n_product = 50
n_client = 100
n_payment_mode = 4

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

cash_registers = []
for i in range(1, n_cash_register + 1):
    cash_registers.append({
        "ClefCaisse": i,
        "NumeroCaisse": fake.random_int(min=1000, max=9999),
        "TypeCaisse": random.choice(["Self-Service", "Standard", "Express"])
    })
df_cash_registers = pd.DataFrame(cash_registers)

stores = []
for i in range(1, n_store + 1):
    stores.append({
        "ClefMagasin": i,
        "NomMagasin": fake.company(),
        "Rue": fake.street_address(),
        "Ville": fake.city(),
        "Pays": fake.country(),
        "Directeur": fake.name(),
        "Zone": fake.city_suffix(),
        "DatePremiereOuverture": fake.date_between(start_date='-20y', end_date='-5y'),
        "DateDerniereRenovation": fake.date_between(start_date='-5y', end_date='today')
    })
df_stores = pd.DataFrame(stores)

promotions = []
for i in range(1, n_promotion + 1):
    start_date = fake.date_between(start_date='-1y', end_date='today')
    promotions.append({
        "ClefPromotion": i,
        "CodePromotion": f"P{i:03}",
        "NomPromotion": fake.catch_phrase(),
        "TypePromotion": random.choice(["Pourcentage", "Montant Fixe", "Offre Gratuite"]),
        "DateDebut": start_date,
        "DateFin": fake.date_between(start_date=start_date, end_date='+1m')
    })
df_promotions = pd.DataFrame(promotions)

products = []
for i in range(1, n_product + 1):
    products.append({
        "ClefProduit": i,
        "CodeProduit": f"PRD{i:03}",
        "DescriptionProduit": fake.catch_phrase(),
        "MarqueProduit": random.choice(["Samsung", "Apple", "Sony", "LG", "HP"]),
        "CategorieProduit": random.choice(["Électronique", "Vêtements", "Alimentaire", "Meubles"]),
        "Rayon": fake.word(),
        "PrixProduitRecommande": round(random.uniform(5, 1000), 2)
    })
df_products = pd.DataFrame(products)

clients = []
for i in range(1, n_client + 1):
    clients.append({
        "ClefClient": i,
        "NomClient": fake.last_name(),
        "PrenomClient": fake.first_name(),
        "NumeroCarteClient": fake.uuid4(),
        "VilleClient": fake.city(),
        "SexeClient": random.choice(["Homme", "Femme"]),
        "Age": random.randint(18, 70),
        "RevenusFoyer": random.randint(20000, 100000)
    })
df_clients = pd.DataFrame(clients)

payment_modes = [
    {"ClefModePaiement": 1, "CodePaiement": "CB",
        "Description": "Carte Bancaire", "TypePaiement": "Électronique"},
    {"ClefModePaiement": 2, "CodePaiement": "ESP",
        "Description": "Espèces", "TypePaiement": "Manuel"},
    {"ClefModePaiement": 3, "CodePaiement": "CHQ",
        "Description": "Chèque", "TypePaiement": "Manuel"},
    {"ClefModePaiement": 4, "CodePaiement": "PAY",
        "Description": "PayPal", "TypePaiement": "Électronique"}
]
df_payment_modes = pd.DataFrame(payment_modes)

df_calendar.to_csv("Calendrier.csv", index=False)
df_time.to_csv("Temps.csv", index=False)
df_cash_registers.to_csv("Caisse.csv", index=False)
df_stores.to_csv("Magasin.csv", index=False)
df_promotions.to_csv("Promotion.csv", index=False)
df_products.to_csv("Produit.csv", index=False)
df_clients.to_csv("Client.csv", index=False)
df_payment_modes.to_csv("ModePaiement.csv", index=False)

print("Datasets generated and saved as CSV files.")
