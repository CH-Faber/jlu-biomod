import type { NextConfig } from "next";

const isProd = process.env.NODE_ENV === 'production';

const nextConfig: NextConfig = {
  // 仅配置图片允许的域名，不开启 assetPrefix
  images: {
    remotePatterns: [
      {
        protocol: 'https',
        hostname: 'jlu-biomod-assets.oss-cn-guangzhou.aliyuncs.com',
        port: '',
        pathname: '/**',
      },
    ],
  },
};

export default nextConfig;
