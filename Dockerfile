FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

# Copy environment.yml instead of lock file
COPY environment.yml /tmp/environment.yml

# Install conda environment using mamba
RUN mamba env update --name base --file /tmp/environment.yml \
    && mamba clean --all -y \
    && fix-permissions "${CONDA_DIR}" \
    && fix-permissions "/home/${NB_USER}"
