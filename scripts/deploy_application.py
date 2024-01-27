import subprocess

def run_ansible_playbook(playbook_path):
    try:
        subprocess.run(['ansible-playbook', '-i', './ansible/inventories/aws/inventory.ini', playbook_path], check=True)
    except subprocess.CalledProcessError as e:
        print(f"Erro ao executar o playbook {playbook_path}. Código de retorno: {e.returncode}")
        exit(1)

def deploy_application():

    # Instala o módulo Docker para Ansible
    run_ansible_playbook('./ansible/playbooks/install_docker_module.yml')

    # Transfere, carrega a imagem Docker e executa o contêiner
    run_ansible_playbook('./ansible/playbooks/deploy_application.yml')

if __name__ == "__main__":
    deploy_application()
