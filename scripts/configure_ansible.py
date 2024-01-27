import subprocess

def run_ansible_playbook(playbook_path):
    try:
        subprocess.run(["ansible-playbook", "-i", "./ansible/inventories/aws/inventory.ini", playbook_path], check=True)
        print(f"Playbook {playbook_path} executado com sucesso.")
    except subprocess.CalledProcessError as e:
        print(f"Erro ao executar o playbook {playbook_path}. Código de retorno: {e.returncode}")

def main():
    # Atualizar a instância
    update_instance_playbook = "./ansible/playbooks/update_instance.yml"
    run_ansible_playbook(update_instance_playbook)

    # Instalar o Docker
    install_docker_playbook = "./ansible/playbooks/install_docker.yml"
    run_ansible_playbook(install_docker_playbook)

if __name__ == "__main__":
    main()