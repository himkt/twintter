# -*- coding: utf-8 -*-

module ExtractInformation
  def extract_tasks tweet
    tasks = []
    if item = now['text'].match(/課題は(.*)(?:です|だ|ら|か|\.|。)/)
      tasks.push(item[1])
    end
    return tasks
  end
  def extract_cancels tweet
    return "休講"
  end
end
