#!/bin/bash
#SBATCH --partition preempt
#SBATCH --time 0-23:00 # set time
#SBATCH --job-name=e3
#SBATCH --chdir=/home/gyeongwk/e3 # working directory

#SBATCH --gres=gpu:A6000:4
#SBATCH --mem=64GB
#SBATCH --cpus-per-task=8 # cpus

#SBATCH --output=logs/%x-%j.out # output log
#SBATCH --error=logs/%x-%j.err # error log
#SBATCH --mail-type=ALL
#SBATCH --mail-user=j1mk1m.dummy@gmail.com

source ~/anaconda3/etc/profile.d/conda.sh

source ~/.bashrc
conda activate verl

export DATA_DISTRIBUTION=math_easy
export EXPERIMENT_NAME=e3_stage1_test
export BASE_MODEL=Qwen/Qwen3-1.7B
export CONTEXT_LENGTH=8096
export LOCAL_DIR=/data/user_data/gyeongwk

bash scripts/grpo/grpo_8k_test.sh
