# ============================================
# Dockerfile - Serveur Unity (Dedicated Server)
# Projet : Pacman Multijoueur
# ============================================

# --- À REMPLIR : version du build Unity (ex: 2022.3.20f1) ---
ARG UNITY_VERSION=À_REMPLIR

FROM ubuntu:22.04

# Dépendances pour lancer un build Unity headless sur Linux
RUN apt-get update && apt-get install -y \
    libgtk-3-0 \
    libasound2 \
    libnss3 \
    libx11-6 \
    libgconf-2-4 \
    libxss1 \
    libxtst6 \
    libcanberra-gtk-module \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Créer un utilisateur non-root (bonne pratique K8s)
RUN useradd -m -u 1000 unityserver

WORKDIR /app

# Copier le build du serveur Unity (généré par Corentin depuis l'éditeur)
# --- À REMPLIR : nom exact de l'exécutable (ex: pacman-server.x86_64) ---
COPY --chown=unityserver:unityserver ./server-build/ /app/

# --- À REMPLIR : port du serveur (celui utilisé dans le code Unity, ex: 7777) ---
EXPOSE À_REMPLIR

USER unityserver

# --- À REMPLIR : même nom d'exécutable qu'au COPY + arguments de lancement ---
CMD ["/app/À_REMPLIR", "-batchmode", "-nographics"]