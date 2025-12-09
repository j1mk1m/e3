# Create the conda environment
conda create -n verl python==3.10
conda activate verl

# Install verl
git clone https://github.com/volcengine/verl.git
cd verl
pip3 install -e .

# Install the latest stable version of vLLM
pip3 install vllm==0.8.3

pip install https://github.com/Dao-AILab/flash-attention/releases/download/v2.7.1.post1/flash_attn-2.7.1.post1+cu12torch2.6cxx11abiFALSE-cp310-cp310-linux_x86_64.whl

pip install seaborn