# Utilisez une image de base Python
FROM python:3.9-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de l'application dans le conteneur
COPY src/ src/
COPY requirements.txt .

# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Commande par défaut pour exécuter l'application (remplacez par la commande réelle de votre application)
CMD ["python", "src/main.py"]
