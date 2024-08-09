local my_models = {
	openai = {
		gpt_4o = "gpt-4o",
		gpt_4o_mini = "gpt-4o-mini",
		gpt_3_5 = "gpt-3.5-turbo-0125",
	},
	perplexity = {
		perplexity_chat = "llama-3.1-sonar-large-128k-chat",
		perplexity_online = "llama-3.1-sonar-large-128k-online",
	},
	anthropic = {
		claude_sonnet = "claude-3-5-sonnet-20240620",
		claude_opus = "claude-3-opus-20240220",
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
	ollama = {},
}

return my_models
