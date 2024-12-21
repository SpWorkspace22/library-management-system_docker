# Stage 1: Build Stage
FROM python:3.9-slim AS builder
RUN apt-get update && apt-get install -y --no-install-recommends build-essential python3-dev libffi-dev
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Final Image
FROM python:3.9-slim
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages
WORKDIR /app
COPY . .
EXPOSE 5000
ENTRYPOINT ["python3", "-m", "flask", "--app", "app.py", "run", "--host=0.0.0.0"]
