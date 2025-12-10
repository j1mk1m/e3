#!/bin/bash
#SBATCH --partition preempt
#SBATCH --time 1-23:00 # set time
#SBATCH --job-name=e3-olmo-rope-test
#SBATCH --chdir=/home/gyeongwk/e3 # working directory

#SBATCH --gres=gpu:8
#SBATCH --mem=256GB
#SBATCH --cpus-per-task=8 # cpus

#SBATCH --output=logs/%x-%j.out # output log
#SBATCH --error=logs/%x-%j.err # error log
#SBATCH --mail-type=ALL
#SBATCH --mail-user=j1mk1m.dummy@gmail.com

source ~/.bashrc
source ~/miniconda3/etc/profile.d/conda.sh
conda activate verl

export DATA_DISTRIBUTION=math_easy
export EXPERIMENT_NAME=e3_olmo_instruct_stage1_rope_test
export BASE_MODEL=allenai/OLMo-2-0425-1B-Instruct
export CONTEXT_LENGTH=4096
export LOCAL_DIR=/project/flame/gyeongwk

bash scripts/grpo/grpo_stage1_rope.sh
