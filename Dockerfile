
# ---------- Builder Stage ----------
FROM python:3.12-alpine AS builder

WORKDIR /install

COPY requirements.txt .

RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# ---------- Final Stage ----------
FROM python:3.12-alpine

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Copy only installed packages
COPY --from=builder /install /usr/local

# Copy app source
COPY ./src .

EXPOSE 5000

CMD ["python", "app.py"]