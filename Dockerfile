# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# No registry-verified custom nodes to install.
# Could not resolve unknown_registry/MarkdownNote - no aux_id provided; skipping installation of this custom node.

# download models into comfyui
RUN comfy model download --url https://huggingface.co/Lightricks/LTX-2.3-fp8/resolve/main/ltx-2.3-22b-distilled-fp8.safetensors --relative-path models/checkpoints --filename ltx-2.3-22b-distilled.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/ltx-2/resolve/main/split_files/text_encoders/gemma_3_12B_it_fp4_mixed.safetensors --relative-path models/clip --filename gemma_3_12B_it_fp4_mixed.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
