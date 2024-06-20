<div align="center">
<h1> Inscure Model Handler</h1>

</div>

# 🚀 How To Start ?

## Setting Up GCP

1. **Start a new project:**

   - Visit the [GCP Console](https://console.cloud.google.com/).
   - Click the project drop-down menu and choose "New Project".
   - Enter a name for your project and click "Create".

2. **Enable API:**

   - Cloud Build API
   - Cloud Run API
   - Use the following code:
     ```
     gcloud services enable artifactregistry.googleapis.com cloudbuild.googleapis.com run.googleapis.com
     ```

## **Clone This Project to your local Repositories**

1. **Open the Cloud Shell:**
   - Click the Cloud Shell icon in the top-right corner of the page.
   - Run the following code in your terminal:
   ```bash
   sudo apt-get update
   ```
   ```bash
   sudo apt install git
   ```
2. **Clone the the project:**
   - In the Cloud Shell terminal, clone the project using the following command:
   ```
   git clone https://github.com/Ahdaaa/py-load-h5-model
   ```

## **Deploy using Cloud Run**

1. **Create a Docker File:**

   - Create a file called `Dockerfile`
   - Populate the file with the following code:

   ```Dockerfile
    FROM tensorflow/tensorflow:2.13.0

    WORKDIR /app

    COPY . /app

    COPY requirements.txt ./
    RUN pip install --no-cache-dir -r requirements.txt

    EXPOSE 8080

    CMD ["python", "main.py"]
   ```

2. **Create an Artifac Registry:**

   - Use this following code to create an Atifac Registry:

   ```
   gcloud artifacts repositories create backend --repository-format=docker --location=asia-southeast2 --async
   ```

   - Build The Dockerfile with the following code:

   ```
   gcloud builds submit --tag asia-southeast2-docker.pkg.dev/${GOOGLE_CLOUD_PROJECT}/backend/inscure-api:1.0.0
   ```

3. **Deploy to Cloud Run:**
   - Deploy the app to Cloud Run.
   - Use the following code:
   ```
   gcloud run deploy --image asia-southeast2-docker.pkg.dev/${GOOGLE_CLOUD_PROJECT}/backend/inscure-api:1.0.0
   ```
   - if prompted, fill the name for your cloud run services and specify your service region.
