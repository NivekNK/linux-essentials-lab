#!/bin/bash

# Generar archivos de configuración en la raíz (para practicar mv)
echo "DB_USER=admin" > database.conf
echo "DB_PASS=secret123" >> database.conf
echo "API_URL=https://api.empresa.local" > services.conf
echo "DEBUG=false" > settings.conf

# Generar un log con contenido variado (para practicar grep y tail)
cat <<EOF > app.log
[INFO] 2026-01-02 09:00:01 - System initialized.
[INFO] 2026-01-02 09:05:12 - Connection established to DB.
[WARNING] 2026-01-02 09:10:45 - High latency detected in API.
[INFO] 2026-01-02 09:15:20 - User 455 logged in.
[CRITICAL] 2026-01-02 09:20:05 - Database connection timeout.
[INFO] 2026-01-02 09:22:11 - Retrying connection...
[CRITICAL] 2026-01-02 09:25:00 - Out of memory in worker node 3.
[INFO] 2026-01-02 09:30:00 - Periodic cleanup job started.
EOF

# Crear un archivo escondido en una ruta profunda (para practicar find)
mkdir -p data/persistence/db
touch data/persistence/db/users.db

# Crear el directorio de scripts
mkdir -p scripts

echo "Laboratorio inicializado correctamente."
