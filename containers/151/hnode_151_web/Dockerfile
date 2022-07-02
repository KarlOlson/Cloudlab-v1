FROM cfee3a34e9c68ac1d16035a81a926786
ARG DEBIAN_FRONTEND=noninteractive
RUN echo 'exec zsh' > /root/.bashrc
RUN apt-get update && apt-get install -y --no-install-recommends curl dnsutils ipcalc iproute2 iputils-ping jq mtr-tiny nano netcat tcpdump termshark vim-nox zsh
RUN curl -L https://grml.org/zsh/zshrc > /root/.zshrc
COPY ec22a7b715770d819b9bc178a260faf4 /proxy.sh
COPY 082b96ec819c95ae773daebde675ef80 /start.sh
COPY d18858afc6bb66ec3a19d872077acfd2 /seedemu_sniffer
COPY 17ac2d812a99a91e7f747e1defb72a29 /seedemu_worker
RUN apt-get install -y npm build-essential python3 python3-pip python-dev libnetfilter-queue-dev nodejs git
RUN pip3 install --upgrade pip
RUN pip3 install py-solc-x web3 python-dotenv scapy==2.4.4
RUN npm update -g
RUN npm install -g ganache
RUN npm install -g npm@8.5.3
RUN pip3 install eth-brownie Flask scapy flask-restful
RUN pip3 install NetfilterQueue eth-utils
RUN git clone --depth 1 --filter=blob:none --no-checkout https://github.com/KarlOlson/Seed_scalable/
WORKDIR /Seed_scalable
RUN git sparse-checkout set bgp_smart_contracts
RUN mv bgp_smart_contracts ../bgp_smart_contracts
WORKDIR /
RUN python3 /bgp_smart_contracts/src/solc_ver_install.py
RUN chmod +x /start.sh
RUN chmod +x /seedemu_sniffer
RUN chmod +x /seedemu_worker
COPY e01e36443f9f72c6204189260d0bd276 /ifinfo.txt
COPY d3d51fdf7f4bad30dc5db560a01ce629 /interface_setup
CMD ["/start.sh"]

