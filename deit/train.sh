nvidia-smi
top -bn 1 -c -i
bash
source activate pytorch
cd ../timm_talk
pip install --upgrade .
cd deit
export OMP_NUM_THREADS=4

python -m torch.distributed.launch --nproc_per_node=8 --master_port=1513 --use_env main.py --model deit_small_patch16_224 --batch-size 150 --num_workers 8 --data-path /scratch/cluster/dilin/datasets/imagenet  --output_dir /scratch/cluster/cygong/vision_transformer_small --mixup 0.01 --mixup-switch-prob 0.0  # contrastive



