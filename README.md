## Setup 
1. Follow instructions here to setup verl: https://verl.readthedocs.io/en/latest/README_vllm0.8.html
2. `conda activate verl`
3. `pip install seaborn`

## Data
Our training and test data are stored on Hugging Face:
- Training data, stage 1: https://huggingface.co/datasets/CMU-AIRe/e3-math-easy
- Training data, stage 2: https://huggingface.co/datasets/CMU-AIRe/e3-math-medhard
- Test data: https://huggingface.co/datasets/CMU-AIRe/hmmt-aime-2025

To set up data for training,
1. Create a local directory to store data
2. Run `python examples/data_preprocess/math/generate_dataset.py --local_dir $dir --remote_dir $hf_dir --split $split`
3. Ensure that `data.train_files` and `data.val_files` in your scripts (e.g., `scripts/grpo/grpo_16k.sh`) point to the downloaded data


## Eval
For eval you can run `bash scripts/eval.sh`
