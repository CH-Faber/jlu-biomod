import type { NextConfig } from "next";

const isProd = process.env.NODE_ENV === 'production';

const nextConfig: NextConfig = {
  // The site has no server-only routes. Export it as static files so it can be
  // deployed behind Nginx without installing Node.js or running a long-lived
  // application process on the production server.
  output: 'export',
  trailingSlash: true,

  // 仅配置图片允许的域名，不开启 assetPrefix
  images: {
    unoptimized: true,
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
