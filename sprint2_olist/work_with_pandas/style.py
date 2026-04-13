# style.py
import matplotlib.pyplot as plt
import seaborn as sns

def setup_style():
    sns.set_style("whitegrid")
    sns.set_palette(["#2E86AB", "#E94F37", "#44AF69", "#F4A261"])
    
    plt.rcParams.update({
        'font.size': 10,
        'axes.titlesize': 14,
        'axes.labelsize': 12,
        'figure.figsize': (10, 6),
        'savefig.dpi': 300,
    })

def decorate(ax, title, xlabel, ylabel):
    ax.set_title(title, fontweight='bold', pad=20)
    ax.set_xlabel(xlabel)
    ax.set_ylabel(ylabel)
    ax.grid(True, alpha=0.3)
    ax.legend()
    return ax