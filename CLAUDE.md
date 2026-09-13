# agent-markdowns

Sammlung der Agentendefinitionen für Claude Code. Dieses Repo enthält **nur
Definitionen** – kein Wissen über konkrete Maschinen.

## Aufbau

```
agents/<name>.md    Agentendefinition: Frontmatter + System-Prompt
```

Installiert wird per Symlink, nicht per Kopie – so gibt es genau eine Quelle
und kein Deploy-Skript, das auseinanderlaufen kann:

```bash
# projektweit, für einen Agenten der zu einem Verzeichnis gehört
ln -s <repo>/agents/uwe.md  ~/docker/.claude/agents/uwe.md

# für alle Verzeichnisse
ln -s <repo>/agents/paul.md ~/.claude/agents/paul.md
```

Start: `claude --agent <name>` aus dem passenden Arbeitsverzeichnis.

## Die Trennlinie

| gehört hierher | gehört in die `CLAUDE.md` des Arbeitsverzeichnisses |
|---|---|
| Verhalten: Rolle, Grenzen, Autonomiegrad, Ton | Wissen: Konventionen, Prüfbefehle, Abläufe |
| gilt auf jeder Maschine gleich | gilt nur für diese eine Maschine |

Maschinenwissen in einer Agentendatei veraltet still und wird dann geglaubt
statt geprüft. Umgekehrt gilt: eine `CLAUDE.md` hält fest, **wie man nachsieht**,
nicht, was gerade gilt.

## Arbeitsregel

Nicht prüfen, ob etwas läuft – prüfen, ob das Richtige ankommt. Ein Agent ohne
seinen Prompt antwortet genauso plausibel wie einer mit. Im Zweifel messen:

```bash
claude --agent <name> -p "Nenne die Kennung dieses Verzeichnisses."
```
