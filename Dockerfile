# Używamy lekkiego obrazu Pythona
FROM python:3.9-slim

# Ustawiamy katalog roboczy
WORKDIR /app

# Kopiujemy pliki do kontenera
COPY requirements.txt requirements.txt
COPY app.py app.py

# Instalujemy zależności
RUN pip install --no-cache-dir -r requirements.txt

# Uruchamiamy aplikację w trybie produkcyjnym z Gunicorn na porcie 20123
CMD ["gunicorn", "-b", "0.0.0.0:20123", "app:app"]
