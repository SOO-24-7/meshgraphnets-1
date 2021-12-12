#!/bin/bash
#SBATCH --job-name=noripple_sum_attention
#SBATCH --partition=gpu_8

i=7
srun --exclusive -N1 -p gpu_8 --gres=gpu python run_model.py --model=cloth --mode=eval --rollout_split=valid --epochs=25 --trajectories=1000 --num_rollouts=100 --core_model=encode_process_decode --message_passing_aggregator=sum --message_passing_steps=${i} --attention=True --ripple_used=False --ripple_generation=equal_size --ripple_generation_number=1 --ripple_node_selection=random --ripple_node_selection_random_top_n=1 --ripple_node_connection=most_influential --ripple_node_ncross=1 --model_last_checkpoint_dir=/home/kit/anthropomatik/sn2444/meshgraphnets/output/flag_simple/Fri-Dec-10-21-33-15-2021/checkpoint_dir