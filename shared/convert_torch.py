from rknn.api import RKNN

# Configs
model_pt = '/app/shared/small_unfold_op13_256x192.pt'
model_rknn = './small_unfold_op13_256x192.rknn'
dataset = './data/data.txt'
platform = 'rv1126'
input_size_list = [[3, 192, 256]] # [C, H, W]

# Create RKNN object
rknn = RKNN()

# pre-process config
print('--> Config model')
rknn.config(
    target_platform=platform,
    mean_values=[[0, 0, 0]], 
    std_values=[[255, 255, 255]], 
    reorder_channel='0 1 2'
)
print('done')

# Load Pytorch model
print('--> Loading model')
ret = rknn.load_pytorch(model=model_pt, input_size_list=input_size_list)
if ret != 0:
    print('Load Pytorch model failed!')
    exit(ret)
print('done')

# Build model
print('--> Building model')
ret = rknn.build(do_quantization=True, dataset=dataset)
if ret != 0:
    print('Build model failed!')
    exit(ret)
print('done')

# Export RKNN model
print('--> Export RKNN model')
ret = rknn.export_rknn(model_rknn)
if ret != 0:
    print(f'Export {model_rknn} failed!')
    exit(ret)
print('done')