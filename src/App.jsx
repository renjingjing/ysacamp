import React from 'react'

function App() {
  return (
    <div className="min-h-screen bg-[#F5F5F7] text-[#1D1D1F] font-sans">
      {/* 导航栏 */}
      <nav className="fixed top-0 w-full z-50 bg-white/80 backdrop-blur-md border-b border-gray-200">
        <div className="max-w-6xl mx-auto px-6 h-16 flex items-center justify-between">
          <div className="text-xl font-bold tracking-tight">YSA CAMP</div>
          <button className="bg-black text-white px-5 py-2 rounded-full text-sm font-medium hover:bg-gray-800 transition">
            立即报名
          </button>
        </div>
      </nav>

      {/* 主视觉区 */}
      <section className="pt-40 pb-20 px-6 text-center">
        <h1 className="text-5xl md:text-7xl font-bold tracking-tight mb-8">
          探索自然，定义成长
        </h1>
        <p className="text-xl md:text-2xl text-gray-500 max-w-3xl mx-auto font-light leading-relaxed">
          为未来领导者打造的沉浸式营地体验。<br />
          结合 AI 科技、荒野生存与人文艺术教育。
        </p>
      </section>

      {/* 分类卡片区 */}
      <div className="max-w-6xl mx-auto grid md:grid-cols-3 gap-8 px-6 pb-32">
        <div className="bg-white rounded-[32px] p-10 shadow-sm hover:shadow-xl transition-all duration-500 border border-gray-100">
          <div className="text-blue-600 font-bold mb-4">01. NATURE</div>
          <h3 className="text-2xl font-bold mb-4">自然探索</h3>
          <p className="text-gray-500 leading-relaxed">在森林与星空下，培养孩子最原始的生命力与观察力。</p>
        </div>

        <div className="bg-white rounded-[32px] p-10 shadow-sm hover:shadow-xl transition-all duration-500 border border-gray-100">
          <div className="text-blue-600 font-bold mb-4">02. STEAM</div>
          <h3 className="text-2xl font-bold mb-4">科技创新</h3>
          <p className="text-gray-500 leading-relaxed">动手搭建属于自己的机器人，在逻辑中寻找创造的快乐。</p>
        </div>

        <div className="bg-white rounded-[32px] p-10 shadow-sm hover:shadow-xl transition-all duration-500 border border-gray-100">
          <div className="text-blue-600 font-bold mb-4">03. LEADERS</div>
          <h3 className="text-2xl font-bold mb-4">领袖素养</h3>
          <p className="text-gray-500 leading-relaxed">通过团队演说与跨学科协作，建立面向未来的自信心。</p>
        </div>
      </div>
    </div>
  )
}

export default App