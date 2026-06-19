# Comandos do meu tmux

Seu prefix do tmux é:

```txt
Ctrl + Espaço
```

Ou seja: aperte `Ctrl+Space`, solte, depois aperte a tecla do comando.

---

## Sessões

Criar nova sessão:

```bash
tmux
```

Criar sessão com nome:

```bash
tmux new -s nome
```

Listar sessões:

```bash
tmux ls
```

Entrar em uma sessão:

```bash
tmux attach -t nome
```

Matar uma sessão:

```bash
tmux kill-session -t nome
```

Sair da sessão sem fechar:

```txt
Ctrl+Space d
```

---

## Configuração

Recarregar `tmux.conf`:

```txt
Ctrl+Space R
```

---

## Painéis

Dividir painel lado a lado:

```txt
Ctrl+Space \
```

Dividir painel em cima/baixo:

```txt
Ctrl+Space -
```

Fechar painel atual:

```txt
Ctrl+Space q
```

Maximizar/restaurar painel atual:

```txt
Ctrl+Space m
```

---

## Navegar entre painéis

```txt
Ctrl+Space h    esquerda
Ctrl+Space j    baixo
Ctrl+Space k    cima
Ctrl+Space l    direita
```

---

## Mover painéis

```txt
Ctrl+Space H    mover para esquerda
Ctrl+Space J    mover para baixo
Ctrl+Space K    mover para cima
Ctrl+Space L    mover para direita
```

---

## Redimensionar painéis

```txt
Ctrl+Space Ctrl+h    diminuir para esquerda
Ctrl+Space Ctrl+j    diminuir para baixo
Ctrl+Space Ctrl+k    aumentar para cima
Ctrl+Space Ctrl+l    aumentar para direita
```

---

## Abas / windows

Criar nova aba no diretório atual:

```txt
Ctrl+Space c
```

Fechar aba atual com confirmação:

```txt
Ctrl+Space Q
```

Renomear aba atual:

```txt
Ctrl+Space r
```

Próxima aba:

```txt
Ctrl+Space n
```

Aba anterior:

```txt
Ctrl+Space p
```

Alternar para última aba usada:

```txt
Ctrl+Space Tab
```

Mover aba para esquerda:

```txt
Ctrl+Space <
```

Mover aba para direita:

```txt
Ctrl+Space >
```

Também funcionam:

```txt
Ctrl+Space Shift+Left
Ctrl+Space Shift+Right
```

---

## Copiar e colar

Entrar no modo de cópia:

```txt
Ctrl+Space [
```

No modo cópia, iniciar seleção:

```txt
v
```

Copiar seleção para o clipboard usando `wl-copy`:

```txt
y
```

Colar buffer do tmux:

```txt
Ctrl+Space P
```

---

## Plugins TPM

Instalar plugins:

```txt
Ctrl+Space I
```

Atualizar plugins:

```txt
Ctrl+Space U
```

Remover plugins não usados:

```txt
Ctrl+Space Alt+u
```

---

## Resumo rápido

```txt
Prefix: Ctrl+Space

\       split vertical/lado a lado
-       split horizontal/cima-baixo
q       fechar painel
Q       fechar aba
c       nova aba
r       renomear aba
R       recarregar config
h/j/k/l navegar painéis
H/J/K/L mover painéis
Ctrl+h/j/k/l redimensionar
m       maximizar painel
n/p     próxima/anterior aba
Tab     última aba usada
[       modo cópia
P       colar
```

> Mouse está desligado no seu config, então o fluxo é 100% teclado.
