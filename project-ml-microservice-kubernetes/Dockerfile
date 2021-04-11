FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /app

## Step 2:
# Copy source code to working directory
COPY . /app
COPY model_data /app/model_data

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
#RUN python3 -m pip install -r requirements.txt
#RUN pip install --upgrade pip && \

RUN pip install --no-cache-dir pip==21.0.1  && \
#pip install certifi && \
 pip install -r requirements.txt    
#pip install -r requirements.txt
    #pip install --requirement -r requirements.txt

## Step 4:
# Expose port 80
EXPOSE 80

## Step 5:
# Run app.py at container launch
CMD ["python", "app.py"]
