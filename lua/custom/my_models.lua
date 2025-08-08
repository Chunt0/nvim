local my_models = {
	openai = {
		gpt_5 = "gpt-5",
		gpt_5_mini = "gpt-5-mini",
		gpt_5_nano = "gpt-5-nano",
		gpt_4o = "gpt-4o",
		gpt_4o_mini = "gpt-4o-mini",
		gpt_3_5 = "gpt-3.5-turbo-0125",
		o1_preview = "o1-preview",
		gpt_4_1 = "gpt-4.1",
		gpt_4_1_nano = "gpt-4.1-nano",
		o1_mini = "o1-mini-2024-09-12",
	},
	perplexity = {
		perplexity_chat = "llama-3.1-sonar-large-128k-chat",
		perplexity_online = "llama-3.1-sonar-large-128k-online",
	},
	anthropic = {
		calude_haiku = "claude-3-5-haiku-latest",
		claude_sonnet = "claude-3-5-sonnet-latest",
		claude_opus = "claude-3-opus-latest",
	},
	groq = {
		llama_3_1_70b = "llama-3.1-70b-versatile",
		llama_3_1_8b = "llama-3.1-8b-instant",
		llama_3_70b = "llama3-70b-8192",
		llama_3_8b = "llama3-8b-8192",
		llama_guard_3 = "llama-guard-3-8b",
		gemma_2 = "gemma2-9b-it",
		gemma_1 = "gemma-7b-it",
		mixtral_8x7b = "mixtral-8x7b-32768",
	},
	ollama = {
		gemma_2 = "gemma2:27b",
		llama_3_1 = "llama3.1:70b-instruct-q4_0",
		hermes_2 = "nous-hermes2:34b",
		yi = "yi:34b",
		deepseek_coder_v2 = "deepseek-coder-v2",
		dolphin_mixtral = "dolphin-mixtral:latest",
		hermes_3 = "hermes3:70b-llama3.1-q4_0",
	},
}

return my_models
