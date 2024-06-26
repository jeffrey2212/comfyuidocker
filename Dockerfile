## Start with the PyTorch 2.2.1 image with CUDA 12.1 and cuDNN 8 support
FROM pytorch/pytorch:2.2.1-cuda12.1-cudnn8-runtime

# Install git
RUN apt-get update && apt-get install -y \
    git \
    build-essential \ 
    ffmpeg libsm6 libxext6 
# Clone the specific repository
RUN git clone https://github.com/comfyanonymous/ComfyUI.git /app

# Set the working directory to the location of the cloned repo
WORKDIR /app

# Install the Python dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install xformers 
RUN pip install xformers 

# Install custom_nodes
# ComfyUI-Manager 
WORKDIR /app/custom_nodes
RUN git clone https://github.com/ltdrdata/ComfyUI-Manager && \
    pip install --no-cache-dir -r ComfyUI-Manager/requirements.txt

# ComfyUI-Workspace-manager
RUN git clone https://github.com/11cafe/comfyui-workspace-manager

# ComfyUI-Crystools
# https://github.com/crystian/ComfyUI-Crystools
RUN git clone https://github.com/crystian/ComfyUI-Crystools && \
    pip install --no-cache-dir -r ComfyUI-Crystools/requirements.txt

# ComfyUI_InstantID
# https://github.com/cubiq/ComfyUI_InstantID
RUN git clone https://github.com/cubiq/ComfyUI_InstantID && \
    pip install --no-cache-dir -r ComfyUI_InstantID/requirements.txt

# ComfyUI_IPAdapter_plus
# https://github.com/cubiq/ComfyUI_IPAdapter_plus
RUN git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus

# rgthree-comfy
# https://github.com/rgthree/rgthree-comfy
RUN git clone https://github.com/rgthree/rgthree-comfy && \
    pip install --no-cache-dir -r rgthree-comfy/requirements.txt

# ComfyUI-Custom-Scripts
# https://github.com/pythongosssss/ComfyUI-Custom-Scripts
RUN git clone https://github.com/pythongosssss/ComfyUI-Custom-Scripts

# efficiency-nodes-comfyui
# https://github.com/jags111/efficiency-nodes-comfyui
RUN git clone https://github.com/jags111/efficiency-nodes-comfyui && \
    pip install --no-cache-dir -r efficiency-nodes-comfyui/requirements.txt

# ComfyUI-MotionCtrl-SVD
# https://github.com/chaojie/ComfyUI-MotionCtrl-SVD
RUN git clone https://github.com/chaojie/ComfyUI-MotionCtrl-SVD && \
    pip install --no-cache-dir -r ComfyUI-MotionCtrl-SVD/requirements.txt

# ComfyUI-MotionCtrl
# https://github.com/chaojie/ComfyUI-MotionCtrl
RUN git clone https://github.com/chaojie/ComfyUI-MotionCtrl && \
    pip install --no-cache-dir -r ComfyUI-MotionCtrl/requirements.txt

# ComfyUI-AnimateDiff-Evolved
# https://github.com/Kosinkadink/ComfyUI-AnimateDiff-Evolved
RUN git clone https://github.com/Kosinkadink/ComfyUI-AnimateDiff-Evolved 

# ComfyUI_FizzNodes
# https://github.com/FizzleDorf/ComfyUI_FizzNodes
RUN git clone https://github.com/FizzleDorf/ComfyUI_FizzNodes && \
    pip install --no-cache-dir -r ComfyUI_FizzNodes/requirements.txt

# https://github.com/Kosinkadink/ComfyUI-Advanced-ControlNet 
RUN git clone https://github.com/Kosinkadink/ComfyUI-Advanced-ControlNet && \
    pip install --no-cache-dir -r ComfyUI-Advanced-ControlNet/requirements.txt

#https://github.com/Fannovel16/comfyui_controlnet_aux
RUN git clone https://github.com/Fannovel16/comfyui_controlnet_aux && \ 
    pip install --no-cache-dir -r comfyui_controlnet_aux/requirements.txt

# https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite
RUN git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite && \
    pip install --no-cache-dir -r  ComfyUI-VideoHelperSuite/requirements.txt


# Expose the port your app runs on
EXPOSE 8188

WORKDIR /app
# Define the command to run your application
CMD ["python", "main.py", "--listen"]

