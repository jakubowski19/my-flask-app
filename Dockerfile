# Używamy lekkiego obrazu Pythona
FROM python:3.9-slim

# Ustawiamy katalog roboczy
WORKDIR /app

# Kopiujemy pliki do kontenera
COPY requirements.txt requirements.txt
COPY app.py app.py

# Instalujemy zależności
RUN pip install --no-cache-dir -r requirements.txt

# Uruchamiamy aplikację w trybie produkcyjnym z Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
