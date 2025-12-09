#!/bin/bash
#SBATCH --partition preempt
#SBATCH --time 1-23:00 # set time
#SBATCH --job-name=e3
#SBATCH --chdir=/home/gyeongwk/e3 # working directory

#SBATCH --gres=gpu:8
#SBATCH --mem=64GB
#SBATCH --cpus-per-task=8 # cpus

#SBATCH --output=logs/%x-%j.out # output log
#SBATCH --error=logs/%x-%j.err # error log
#SBATCH --mail-type=ALL
#SBATCH --mail-user=j1mk1m.dummy@gmail.com

source ~/miniconda3/etc/profile.d/conda.sh

source ~/.bashrc
conda activate verl

export EPOCHS=2
export LOCAL_DIR=/project/flame/gyeongwk
export N_GPUS_PER_NODE=8
export NNODES=1
export DATA_DISTRIBUTION=math_medhard
export EXPERIMENT_NAME=e3_stage2
export BASE_MODEL=/project/flame/gyeongwk/checkpoints/e3/e3_stage1/global_step_200/actor/hf-format
export CONTEXT_LENGTH=16384

bash scripts/grpo/grpo.sh
